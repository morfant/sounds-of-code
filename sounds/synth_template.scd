// Template
/*==========================================*/
// license : MIT
// description : Mix(n, Ringz(Impuse))
// Creator :
/*==========================================*/

(
{
	 // 1. Set synthdef name
	var name = \dense;


	// 2. Make your synthdef!
	SynthDef(name, {
		arg decay = 0.01, prob = 0.5;
		var sig, env, num = 30;
		sig = Mix.fill(num, {
			Ringz.ar(
				CoinGate.ar(prob, Impulse.ar(10) * 0.5),
				Rand(1000, 7000) * [1, 1.5], decay, 1/num)});
		Out.ar(0, Pan2.ar(sig, 0))


	// 3. leave below code, Please
	}).store;
	name;
}.value();
)


// Optional part
/* Stay commented below!
// Add example/application/description

a = Synth(\dense, [\decay, 0.1, \prob, 0.5]);
a.set(\decay, 0.1); // decay time이 길어질 수록 피드백으로 인한 배음들이 살아난다
a.set(\prob, 0.1);

*/
