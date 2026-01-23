namespace srv.pct;

// using {  as pct } from '..';
using {db.pct as pct} from '..';
using { codes as CodeList } from '..';



service PCTService {
    @odata.draft.enabled
    entity PCTExemptions as projection on pct.PCTExemptions
        actions {
            action submit();
            action response(to_Status: String, to_ProposedAction: String, deductedPeriod: Integer, assignedEngineer: String, 
            approverName: String);
        };

    annotate PurchaseOrder with @odata.draft.enabled;
    entity PurchaseOrder as projection on pct.PurchaseOrder;

    entity ProposedAction as projection on CodeList.ProposedAction;


}
