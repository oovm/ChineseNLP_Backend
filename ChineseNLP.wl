Needs["JLink`"];
SetOptions[InstallJava, JVMArguments -> "-Xmx2g"];
SetOptions[ReinstallJava, JVMArguments -> "-Xmx2g"];
If[!TrueQ[ChineseNLP`PackageScope`Private`$LoadCompleted],
	<< ChineseNLP`ChineseNLPLoader`
];
