sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"pctexemptionapp/test/integration/pages/PCTExemptionsList",
	"pctexemptionapp/test/integration/pages/PCTExemptionsObjectPage"
], function (JourneyRunner, PCTExemptionsList, PCTExemptionsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('pctexemptionapp') + '/test/flp.html#app-preview',
        pages: {
			onThePCTExemptionsList: PCTExemptionsList,
			onThePCTExemptionsObjectPage: PCTExemptionsObjectPage
        },
        async: true
    });

    return runner;
});

