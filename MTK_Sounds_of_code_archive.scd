(/*=============== Main ===============*/
var allSynthDescLibs = SynthDescLib.all;
var baseName = "mtk_soundlib";
var kindKeys = [];
var libNames = IdentityDictionary.new; // {kick : base_kick, soft : base_soft},
var pathNames = IdentityDictionary.new; // {kick: path_kick, soft: path_soft}

var synthPath = Platform.userAppSupportDir++"/synthdefs/";
var currentPath = thisProcess.nowExecutingPath.dirname;
var soundPath = currentPath+/+"sounds";
var kindPaths = PathName.new(soundPath).folders;

// Start message
("=========Sounds of code MTK=========="+"\n\n\n").postln; // blablabla...


// Make SynthDescLibs
kindPaths.do{|folder|
	var pathStr = folder.fullPath;
	var splitPath = pathStr.split($/);
	var name = splitPath[splitPath.size - 2];
	var libName = baseName++"_"++name;
	// folder.postln;
	kindKeys = kindKeys.add(name); // Array
	libNames.put(name, libName); // IdentityDictionary
	pathNames.put(name, pathStr); // IdentityDictionary
	SynthDescLib.new(libName, s);
};

// Load synthdefs, read to synthdesclib
kindKeys.do{|key|
	var count = 0;
	var folder = PathName.new(pathNames.at(key));

	(">> Reading"+folder+"...").postln;

	folder.filesDo{|f|

		var extType = f.extension;
		// f.postln;
		//extType.postln;
		if (extType == "scd", {
			var file = f.fileName;
			var libName = libNames.at(key);

			var lib = allSynthDescLibs.at(libNames.at(key).asSymbol); // key must be a symbol type, not string
			var synthName = f.fullPath.loadPaths; // exec .scd files, get synthdef name
			synthName = synthName[0]; // [name] --> name
			lib.read(synthPath++synthName++".scsyndef"); // load .scsyndef file to each synthdesclib

			("   +"+file+"-->"+synthName).postln;
			count = count + 1;
		    }
		);
	};

	(">> Load"+count+"file(s).\n").postln;

};

// open browser
SynthDescLib.global.browse;
)


/*=============== Todo ===============*/
// 소리를 들어볼 수 있는 기능, all - 순차적으로, 이름을 표시하면서 / each - 이름을 표시하면서
// 소리의 카테고리별 분류 기능 - 추후 1단계 이상의 depth도 가능하도록