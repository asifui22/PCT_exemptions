namespace db.pct;

using {
    db.pct.PCTExemptions,
    db.pct.PurchaseOrder
} from './PCTExemptions';


annotate PCTExemptions with {

    ID                 @title: '{i18n>UUID}'; // @UI.Hidden;
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
    deductedPeriod     @title: '{i18n>deductedPeriod}';

    Attachments        @title: '{i18n>Attachments}';
    fileName           @title: '{i18n>FileName}';
    approverName @title: '{i18n>approverName}';

}

annotate PCTExemptions with {
    title               @mandatory;
    to_Status           @Common.Text: to_Status.name                      @Common.TextArrangement: #TextOnly;
    to_ProposedAction   @Common.Text: to_ProposedAction.name              @Common.TextArrangement: #TextOnly;
    to_PurchaseOrderNo  @Common.Text: to_PurchaseOrderNo.PurchaseOrderNo  @Common.TextArrangement: #TextOnly;

    to_Status           @Common.ValueListWithFixedValues                  @readonly;
    to_ProposedAction   @Common.ValueListWithFixedValues                  @readonly;

    Requestdetails      @UI.MultiLineText;
    statusDate          @readonly;
    assignedEngineer    @readonly;
    deductedPeriod      @readonly;
    fileName            @readonly;


};

annotate PurchaseOrder with {
    ID              @title: '{i18n>UUID}'  @UI.Hidden;
    PurchaseOrderNo @title: '{i18n>PurchaseOrderNo}';
    poDate          @title: '{i18n>PurchaseOrderDate}';
    BusinessPartner @title: '{i18n>BusinessPartner}'; //later will be change with Business
    POStatus        @title: '{i18n>POStatus}'; //later will be change with Business
    companyCode     @title: '{i18n>CompanyCode}'; //later will be change with Business
    plant           @title: '{i18n>Plant}'; //later will be change with Business
}
