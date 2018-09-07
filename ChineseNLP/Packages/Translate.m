(* ::Package:: *)
(* ::Title:: *)
(*Translate(Translate)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-08-30*)
(*Copyright: Mozilla Public License Version 2.0*)
(* ::Program:: *)
(*1.软件产品再发布时包含一份原始许可声明和版权声明。*)
(*2.提供快速的专利授权。*)
(*3.不得使用其原始商标。*)
(*4.如果修改了源代码，包含一份代码修改说明。*)
(**)
(* ::Text:: *)
(*这里应该填这个函数的介绍*)
(* ::Section:: *)
(*函数说明*)
DecomposePinyin::usage = "";
ToPinyin::usage = "";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
ExNumber::usage = "程序包的说明,这里抄一遍";
Begin["`Translate`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$Translate = "V1.0";
Updated$Translate = "2018-08-30";
(* ::Subsubsection:: *)
(*功能块 1*)



pinyinDictionary := pinyinDictionary = JLink`JavaNew["com.hankcs.hanlp.dictionary.py.PinyinDictionary"];
DecomposePinyin[str_String] := Block[
	{
		objs, decom, convertToPinyinArray, toString,
		getShengmu, getYunmu, getTone, getPinyinWithToneMark
	},
	objs = pinyinDictionary@convertToPinyinArray[str];
	decom = {
		Characters@str,
		Through[objs@getShengmu[][toString[]]],
		Through[objs@getYunmu[][toString[]]],
		Through[objs@getTone[]],
		Through[objs@getPinyinWithToneMark[]]
	} // Transpose;
	<|"Char" -> #1, "Sheng" -> #2, "Yun" -> #3, "Ying" -> #4, "Mark" -> #5|>& @@@ decom
];
ToPinyin[str_String, mode_Integer : 1] := Block[
	{d = DecomposePinyin[str], f},
	f = If[#["Mark"] == "none", # /. {5 -> #["Char"], "none" -> #["Char"]}, #]& /@ d;
	Switch[mode,
		1, #Mark& /@ f,
		2, StringRiffle[DeleteDuplicates@{#Sheng, #Yun, #Ying}, ""]& /@ f,
		3, StringRiffle[DeleteDuplicates@{#Sheng, #Yun}, ""]& /@ f,
		4, #Sheng& /@ f,
		5, #Yun& /@ f,
		6, #Ying& /@ f,
		_, f // Dataset
	]
];


(* ::Subsubsection:: *)
(*功能块 2*)
ExampleFunction[2] = "我就是个示例函数,什么功能都没有";


(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{DecomposePinyin, ToPinyin},
	{Protected, ReadProtected}
];
End[]
