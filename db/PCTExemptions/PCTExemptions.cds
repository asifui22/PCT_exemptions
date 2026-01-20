namespace db.pct;

using {
    cuid,
    managed
} from '@sap/cds/common';
using {
    codes.Status,
    codes.ProposedAction
} from '../MasterData/commonCode';


entity PCTExemptions : cuid, managed {

    requestNo          : String(10)   @Core.Computed             @assert.unique;
    title              : String(40);
    to_PRNumber        : String(10);
    pRLastApprovalDate : Date;
    RFQNo              : String(10);
    to_PurchaseOrderNo : Association to PurchaseOrder;
    Requestdetails     : String(255);
    to_Status          : Association to Status;
    statusDate         : Date;
    assignedEngineer   : String(50); //•	Assigned Performance Engineer
    to_ProposedAction  : Association to ProposedAction;

    // @Core.MediaType
    Attachments        : LargeBinary  @Core.MediaType: fileName  @Core.ContentDisposition.Type: 'inline';
    fileName           : String       @Core.IsMediaType;

}


entity PurchaseOrder : cuid {
    PurchaseOrderNo : String(10);
    poDate          : DateTime;
    BusinessPartner : String(10);
    POStatus        : String;
    companyCode     : String(4);
    plant           : String(10);
}
