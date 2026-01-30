using {srv.pct.PCTService.PCTExemptions} from './PCTService';


// annotate PCTExemptions @(restrict: [
//   { grant: 'READ',   to: 'authenticated-user' },
//   { grant: 'CREATE', to: 'content-maintainer' },
//   { grant: 'UPDATE', to: 'content-maintainer' },
//   { grant: 'DELETE', to: 'admin' },
// ]) {

// }


annotate PCTExemptions with actions {
    submit   @(
        Common.Label                       : '{i18n>Submit}',
        cds.odata.bindingparameter.name    : '_it',
        // Core.OperationAvailable        : {$edmJson: [{$Ne: [
        //     {$Path: '_it/isSubmitted'},
        //     true,
        // ]}]},

        Common.SideEffects.TargetProperties: ['_it/*']

    );
    response @(
        cds.odata.bindingparameter.name    : '_it',
        // Core.OperationAvailable            : {$edmJson: {$And: [
        //     {$Ne: [
        //         // {$Path: '_it/to_Status_code'},
        //         // 'Open'
        //     ]},
        //     {$Ne: [
        //         // {$Path: '_it/isSubmitted'},
        //         // true,
        //     ]}
        // ]}},
        Common.SideEffects.TargetProperties: ['_it/*']
    )
}
