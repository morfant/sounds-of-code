// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : Env.perc() * DynKlank(Impuse)
// Creator : Gang il, Lee
/*==========================================*/

(
{
	// 1. Set synthdef name
	var name = \ting;

	// 2. Make your synthdef!
	SynthDef(name, {
		arg gate = 1, freq = 2.0, div_q = 4;
		var env, sig;
		env = EnvGen.kr(Env.perc(), gate, doneAction: Done.freeSelf);
		sig = DynKlank.ar(
			`[
				[
					500,
					1078 + SinOsc.kr(Rand(1/2, 12.0)).range(-500, 1500),
					1201.5,
					1723
				],
				[1, 3, 5, 2].normalizeSum,
				[1, 1, 0.5, 0.3]/div_q
			],
			Impulse.ar([freq, freq.rand], 0, 0.1)
		);
		Out.ar(0, Pan2.ar(sig*env));


		// 3. leave below code, Please
	}).store;
	name;
}.value();
)


// Optional part
/* Stay commented below!
// Add example/application/description

(
fork{
	inf.do{
        a = Synth(\ting);
		a.set(\freq, rrand(0.1, 2.0), \div_q, 8);
		(rrand(0.2, 2.0)/2).wait;
	}
}
)


*/
