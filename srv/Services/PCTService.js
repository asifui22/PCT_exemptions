const cds = require("@sap/cds");
const { SELECT, UPDATE } = require("@sap/cds/lib/ql/cds-ql");

class PCTService extends cds.ApplicationService {
  init() {
    const { PCTExemptions } = this.entities;

    this.before("CREATE", PCTExemptions, async (req) => {
      // var PCTObjectManager = new PCTManager(req);
      // PCTObjectManager.PCTAssigneRequestID(req, PCTExemptions);
      if (req.data.requestNo) return;

      const tx = cds.tx(req);
      const last = await tx.run(
        // SELECT.one.from('db.pct.PCTExemptions').columns('requestNo').orderBy({requestNo: 'desc'})
        SELECT.one
          .from(PCTExemptions)
          .columns(PCTExemptions.requestNo)
          .orderBy({ requestNo: "desc" }),
      );
      let next = 1;
      if (last?.requestNo) {
        next = Number(last.requestNo) + 1;
      }
      req.data.requestNo = `${String(next).padStart(10, "0")}`;
    });

    this.before("SAVE", PCTExemptions, async (req) => {
      if (req.data.to_Status_code == "Open") {
        // await UPDATE(req).set({
        //     to_Status_code : "PENDING"
        // })
        req.data.to_Status_code = "Open";
        req.data.statusDate = new Date();
      }
    });


    this.before("UPDATE", PCTExemptions, async (req) => {
      if (req.data.to_Status_code == "Open") {
        // await UPDATE(req).set({
        //     to_Status_code : "PENDING"
        // })
        req.data.to_Status_code = "Open";
        req.data.statusDate = new Date();
      }
    });

    this.on("submit", PCTExemptions, async (req) => {
      const { ID } = req.params[0];

      const data = await SELECT.one.from(PCTExemptions).where({ ID });
      if (!data) req.error(404, "PCT Exemption not found");

      //  Start workflow
      await startWorkflow(req, data);

      //  Update status
      await UPDATE(PCTExemptions)
        .set({
          to_Status_code: "Pending",
          statusDate: new Date(),
          isSubmitted: false
        })
        .where({ ID });

      //  Notify UI
      req.info("Request submitted successfully");

      return { to_Status_code: "Pending" };
    });

    async function startWorkflow(req, data) {
      // const cds = require("@sap/cds");

      //  Connect to Workflow Runtime via destination
      const wf = await cds.connect.to("spa_process_destination");
    
      const definitionId =
        "us10.f330de2atrial.pctexemption1.pCTExemptionProcess";
      const payload = {
        definitionId: definitionId, //process.env.PCT_WORKFLOW_DEFINITION_ID,
        context: {
          pct_exemption: {
            requestID: data.ID,
            requestNo: data.requestNo,
            title: data.title,
            assignedEngineer: data.assignedEngineer || "",
            createdOn: data.createdAt,
            createdBy: data.createdBy,
            IsActiveEntity: req.params[0].IsActiveEntity
          },
        },
      };

      //  Call Workflow Runtime API
      await wf.post("/workflow/rest/v1/workflow-instances", payload);
      // const respFromWF = await wf.post("/workflow/rest/v1/workflow-instances", payload);
      console.log('Playload:', payload);
      // const workflowInstanceId = respFromWF.id

    }

    this.on("response", PCTExemptions, async (req) => {
      const { ID } = req.params[0];
      const { to_Status, to_ProposedAction, deductedPeriod, assignedEngineer, approverName } = req.data;

      await UPDATE(PCTExemptions)
        .set({
          to_Status_code: to_Status,
          to_ProposedAction_code: to_ProposedAction,
          statusDate: new Date(),
          deductedPeriod: deductedPeriod,
          assignedEngineer: assignedEngineer,
          approverName: approverName
        })
        .where({ ID });
    });

    return super.init();
  }
}
module.exports = PCTService;
