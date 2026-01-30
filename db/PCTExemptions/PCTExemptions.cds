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
    pRLastApprovalDate : DateTime;
    RFQNo              : String(10);
    to_PurchaseOrderNo : Association to PurchaseOrder;
    Requestdetails     : String(255);
    to_Status          : Association to Status;
    statusDate         : DateTime;
    assignedEngineer   : String(50); //•	Assigned Performance Engineer
    to_ProposedAction  : Association to ProposedAction;
    deductedPeriod     : Integer;
    isSubmitted        : Boolean default true;

    approverName       : String;

    // @Core.MediaType
    Attachments        : LargeBinary  @Core.MediaType: fileName  @Core.ContentDisposition.Type: 'inline';
    fileName           : String       @Core.IsMediaType;

    to_Attachments     : Composition of many Attachments
                             on to_Attachments.to_PCTExemption = $self;

    POItems            : Composition of many PurchaseOrderItem
                             on POItems.to_PCTExemption = $self;

}

entity Attachments : cuid, managed {
    to_PCTExemption : Association to PCTExemptions;
    name            : String;
    link            : String(1500);

}


entity PurchaseOrderItem : cuid {
    to_PCTExemption    : Association to PCTExemptions;
    to_PurchaseOrderNo : Association to PurchaseOrder; //String(10);
    poDate             : DateTime;
    BusinessPartner    : String(10);
    POStatus           : String;
    companyCode        : String(4);
    plant              : String(10);
}


entity PurchaseOrder : cuid {
    PurchaseOrderNo : String(10);
    poDate          : DateTime;
    BusinessPartner : String(10);
    POStatus        : String;
    companyCode     : String(4);
    plant           : String(10);
}
