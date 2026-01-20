namespace srv.pct;
// using {  as pct } from '..';
using {  db.pct as pct } from '../../db/PCTExemptions/PCTExemptions';


// @path:'pctExemptionsrv'
service PCTService {
    annotate PCTExemptions with @odata.draft.enabled ;
    
entity PCTExemptions as projection on pct.PCTExemptions actions {
   action submit();
};
annotate PurchaseOrder with @odata.draft.enabled ;
entity PurchaseOrder as projection on pct.PurchaseOrder;

    

}