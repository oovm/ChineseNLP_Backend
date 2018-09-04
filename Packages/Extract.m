(* ::Package:: *)
(* ::Title:: *)
(*Extract(Extract)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-09-03*)
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
ExtractNewWord::usage = "";
ExtractKeyWord::usage = "";
ExtractSummary::usage = "";
ExtractPhrase::usage = "";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
Begin["`Extract`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$Extract = "V1.0";
Updated$Extract = "2018-09-03";
(* ::Subsubsection:: *)
(*功能块 1*)

Options[ExtractNewWord] = {"Aggregation" -> 100, "Entropy" -> 0.5, "Frequency" -> 0, "Dictionary" -> True};
ExtractNewWord[text_, num_ : 10, len_ : 4, OptionsPattern[]] := Block[
	{class, newWordDiscover, objs, discover, toString, a, e, f, t},
	{f, e, a, t} = OptionValue[{"Frequency", "Entropy", "Aggregation", "Dictionary"}];
	class = JLink`LoadJavaClass["com.hankcs.hanlp.mining.word.NewWordDiscover"];
	newWordDiscover = JLink`JavaNew[class, len, f, e, a, t];
	objs = JLink`JavaObjectToExpression@newWordDiscover@discover[text, num];
	Through[objs@toString[]]
];



Options[ExtractKeyWord] := {"Rank" -> False};
ExtractKeyWord[text_, num_ : 1, OptionsPattern[]] := Block[
	{objs, getTermAndRank, getKeywordList, keySet, values, toArray},
	textRankKeyword := textRankKeyword = JLink`JavaNew[JLink`LoadJavaClass["com.hankcs.hanlp.summary.TextRankKeyword"]];
	If[TrueQ@OptionValue["Rank"],
		objs = textRankKeyword@getTermAndRank[text, num];
		AssociationThread[objs@keySet[]@toArray[] -> objs@values[]@toArray[]],
		objs = textRankKeyword@getKeywordList[text, num];
		objs@toArray[]
	]
];

ExtractSummary[text_, num_ : 5] := JLink`JavaObjectToExpression[com`hankcs`hanlp`HanLP`extractSummary[text, num]];
ExtractPhrase[text_, num_ : 5] := JLink`JavaObjectToExpression[com`hankcs`hanlp`HanLP`extractPhrase[text, num]];



(* ::Subsubsection:: *)
(*功能块 2*)



(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{ },
	{Protected, ReadProtected}
];
End[]
