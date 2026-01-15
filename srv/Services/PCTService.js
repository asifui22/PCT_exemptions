const cds = require("@sap/cds");
const { SELECT } = require("@sap/cds/lib/ql/cds-ql");

class PCTService extends cds.ApplicationService {
  init() {
    const { PCTExemptions } = this.entities;

    this.before("CREATE", PCTExemptions, async (req) => {
      // var PCTObjectManager = new PCTManager(req);
      // PCTObjectManager.PCTAssigneRequestID(req, PCTExemptions);


      if (req.data.requestNo) return;

      const tx = cds.tx(req);
      const last = await tx.run(
        SELECT.one.from('db.pct.PCTExemptions').columns('requestNo').orderBy({requestNo: 'desc'})
      );
      let next = 1;
      if(last?.requestNo) {
        // next = Number(last.requestNo.replace('REQ', '')) + 1;
        next = Number(last.requestNo) + 1;
      }


      // req.data.requestNo = `REQ${String(next).padStart(6, '0')}`;
      req.data.requestNo = `${String(next).padStart(10, '0')}`;



    });

    return super.init();
  }
}
module.exports = PCTService;
