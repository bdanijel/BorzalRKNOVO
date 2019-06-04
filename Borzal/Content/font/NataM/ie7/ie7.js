/* To avoid CSS expressions while still supporting IE 7 and IE 6, use this script */
/* The script tag referencing this file must be placed before the ending body tag. */

/* Use conditional comments in order to target IE 7 and older:
	<!--[if lt IE 8]><!-->
	<script src="ie7/ie7.js"></script>
	<!--<![endif]-->
*/

(function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'NataM\'">' + entity + '</span>' + html;
	}
	var icons = {
		'nmicon-SPRLogo': '&#xeab0;',
		'nmicon-solidarity': '&#xeaaf;',
		'nmicon-Solidarnost3': '&#xeaa9;',
		'nmicon-Solidarnost2': '&#xeaab;',
		'nmicon-Solidarnost': '&#xeaad;',
		'nmicon-Metadata2': '&#xe90b;',
		'nmicon-Metadata': '&#xe90d;',
		'nmicon-Schema2': '&#xe93f;',
		'nmicon-stats-bars-outline': '&#xeaa1;',
		'nmicon-diPeteljkaNFUniColor': '&#xea9f;',
		'nmicon-diPeteljkaNF': '&#xeaa0;',
		'nmicon-diPeteljkaUnicolor': '&#xea9b;',
		'nmicon-diPeteljka': '&#xea9c;',
		'nmicon-SDGUnicolor': '&#xea89;',
		'nmicon-SDG': '&#xea8a;',
		'nmicon-information': '&#xea87;',
		'nmicon-theatre': '&#xea88;',
		'nmicon-WomanHealth': '&#xea86;',
		'nmicon-Vaccination': '&#xea5c;',
		'nmicon-circle-check': '&#xea5a;',
		'nmicon-circle': '&#xf111;',
		'nmicon-circle-check-o': '&#xea5b;',
		'nmicon-check': '&#xf00c;',
		'nmicon-check-square-o': '&#xf046;',
		'nmicon-circle-o': '&#xf10c;',
		'nmicon-file-pdf-o': '&#xf1c1;',
		'nmicon-file-word-o': '&#xf1c2;',
		'nmicon-file-excel-o': '&#xf1c3;',
		'nmicon-file-powerpoint-o': '&#xf1c4;',
		'nmicon-circle-thin': '&#xf1db;',
		'nmicon-dot-circle-o': '&#xf192;',
		'nmicon-education': '&#xe90a;',
		'nmicon-health': '&#xe90e;',
		'nmicon-health2': '&#xe910;',
		'nmicon-economy': '&#xe911;',
		'nmicon-nature1': '&#xe912;',
		'nmicon-nature12': '&#xe913;',
		'nmicon-demography': '&#xe914;',
		'nmicon-agriculture': '&#xe915;',
		'nmicon-construction1': '&#xe916;',
		'nmicon-education2': '&#xe917;',
		'nmicon-house': '&#xe918;',
		'nmicon-justice': '&#xe919;',
		'nmicon-nature': '&#xe91a;',
		'nmicon-participation': '&#xe91b;',
		'nmicon-social': '&#xe91c;',
		'nmicon-food': '&#xe91d;',
		'nmicon-woman': '&#xe91e;',
		'nmicon-data': '&#xe91f;',
		'nmicon-saobracaj': '&#xe920;',
		'nmicon-participation2': '&#xe921;',
		'nmicon-tree': '&#xe922;',
		'nmicon-bookmark': '&#xe923;',
		'nmicon-car2': '&#xe924;',
		'nmicon-hand': '&#xe925;',
		'nmicon-home': '&#xe926;',
		'nmicon-home2': '&#xe927;',
		'nmicon-home3': '&#xe928;',
		'nmicon-office': '&#xe929;',
		'nmicon-book': '&#xe92a;',
		'nmicon-social2': '&#xe92b;',
		'nmicon-food2': '&#xe92c;',
		'nmicon-food3': '&#xe92d;',
		'nmicon-cake': '&#xe92e;',
		'nmicon-stats': '&#xe92f;',
		'nmicon-stats2': '&#xe930;',
		'nmicon-socialcare': '&#xe931;',
		'nmicon-natureleaves': '&#xe932;',
		'nmicon-wheat': '&#xe933;',
		'nmicon-wheat2': '&#xe934;',
		'nmicon-woman1': '&#xe935;',
		'nmicon-participation1': '&#xe936;',
		'nmicon-sort-amount-asc': '&#xea4c;',
		'nmicon-sort-amount-desc': '&#xea4d;',
		'nmicon-user-md': '&#xf0f0;',
		'nmicon-pagelines': '&#xf18c;',
		'nmicon-automobile': '&#xf1b9;',
		'nmicon-heartbeat': '&#xf21e;',
		'nmicon-balance-scale': '&#xf24e;',
		'nmicon-volume-control-phone': '&#xf2a0;',
		'nmicon-american-sign-language-interpreting': '&#xf2a3;',
		'nmicon-sign-language': '&#xf2a7;',
		'nmicon-MetaData': '&#xe937;',
		'nmicon-IndikatoriUnicolor': '&#xea61;',
		'nmicon-Indikatori': '&#xea62;',
		'nmicon-Arrow': '&#xea60;',
		'nmicon-dbOnline': '&#xea5f;',
		'nmicon-water': '&#xea5e;',
		'nmicon-CompLiteracyBlue': '&#xea41;',
		'nmicon-CompLiteracyBlueHand': '&#xea25;',
		'nmicon-CompLiteracyGreen': '&#xe9ae;',
		'nmicon-CompLiteracyGreenHand': '&#xea09;',
		'nmicon-CompBooks': '&#xe9c3;',
		'nmicon-Books': '&#xe9e9;',
		'nmicon-employeesUniColor': '&#xe9a7;',
		'nmicon-employees': '&#xe9a8;',
		'nmicon-AverageAge': '&#xe904;',
		'nmicon-Lekar': '&#xe998;',
		'nmicon-LekarPacijentiUniColor': '&#xe999;',
		'nmicon-LekarPacijenti': '&#xe99a;',
		'nmicon-vrticUniColor': '&#xe94e;',
		'nmicon-vrtic': '&#xe94f;',
		'nmicon-RZSLogoUniColor': '&#xe941;',
		'nmicon-RZSLogo': '&#xe942;',
		'nmicon-diLogoUniColor': '&#xe905;',
		'nmicon-diLogo': '&#xe906;',
		'nmicon-AverageAge2': '&#xe908;',
		'nmicon-Kids': '&#xe909;',
		'0': 0
		},
		els = document.getElementsByTagName('*'),
		i, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		c = el.className;
		c = c.match(/nmicon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
}());
