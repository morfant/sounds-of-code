// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : Env.perc() * DynKlank(CombN(LFNoise2)))
// Creator : Gangil, Lee
/*==========================================*/

(
{
	// 1. Set synthdef name
	var name = \dung;


	// 2. Make your synthdef!
	SynthDef(name, {
		arg freq = 440 * 1.5, gate = 1;
		var sig, fil, env;
		env = EnvGen.kr(Env.perc(), gate, doneAction: 2);
		sig = CombN.ar(LFNoise2.ar(freq));
		fil = DynKlank.ar(`[
			[0.2.rrand(1.0), 0.7.rrand(2.0.rand), 1.2] * 1000,
			[1.0, 1.0, 1.0]/100,
			[1.0, 1.0, 1.0]/1
		], sig * env);

		Out.ar(0, Pan2.ar(fil));


		// 3. leave below code, Please
	}).store;
	name;
}.value();
)


// Optional part
/* Stay commented below!
// Add example/application/description

(
	Ppar([
		Pbind(
			\instrument, \dung,
			\freq, Pseq([Pseq([440], 7), 330]*1.5, inf),
			\dur, Pseq([1], inf)
		),
		Pbind(
			\instrument, \dung,
			\freq, 150*[1, 1.5],
		\div, Prand([
			Pseq([3], 16), Pseq([4], 16), Pseq([2], 16)
		], inf),
		\dur, Pseq([1 / Pkey(\div).trace], inf)
)]).play(quant: 4);
)

*/
