namespace db.pct;

using {
    db.pct.PCTExemptions,
    db.pct.PurchaseOrder
} from './PCTExemptions';


annotate PCTExemptions with {

    requestNo          @title: '{i18n>RequestNo}';
    title              @title: '{i18n>Title}';
    to_PRNumber        @title: '{i18n>PRNumber}';
    pRLastApprovalDate @title: '{i18n>pRLastApprovalDate}';
    RFQNo              @title: '{i18n>RFQNo}';
    to_PurchaseOrderNo @title: '{i18n>PurchaseOrderNo}';
    Requestdetails     @title: '{i18n>Requestdetails}';
    to_Status          @title: '{i18n>Status}';
    statusDate         @title: '{i18n>statusDate}';
    assignedEngineer   @title: '{i18n>assignedEngineer}'; //•	Assigned Performance Engineer
    to_ProposedAction  @title: '{i18n>ProposedAction}';

    @Core.MediaType
    Attachments        @title: '{i18n>Attachments}';

}

annotate PCTExemptions with {
    to_Status          @Common.Text: to_Status.name          @Common.TextArrangement: #TextOnly;
    to_ProposedAction  @Common.Text: to_ProposedAction.name  @Common.TextArrangement: #TextOnly;
    to_PurchaseOrderNo @Common.Text: to_PurchaseOrderNo.PurchaseOrderNo  @Common.TextArrangement: #TextOnly;
};

annotate PurchaseOrder with {
    PurchaseOrderNo @title: '{i18n>PurchaseOrderNo}';
    BusinessPartend @title: '{i18n>BusinessPartend}'; //sample
    POStatus        @title: '{i18n>POStatus}';
    companyCode     @title: '{i18n>CompanyCode}';
    plant           @title: '{i18n>Plant}';
}
