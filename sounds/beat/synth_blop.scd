// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : Trig1, LFNoise2, Rand)
// Creator : Youngjoo Ryu
/*==========================================*/

(
{
	 // 1. Set synthdef name
	var name = \blop;


	// 2. Make your synthdef!
	SynthDef(name, {
		var source, local, trig, freq, env, feedback;

		trig = Trig1.ar(Dust.ar(1), 0.2);
		source = LFNoise2.ar(LFSaw.kr(1).range(100, 8000));
		freq = Rand(220, 880);

		source = source + SinOsc.ar(freq);
		env = EnvGen.kr(Env.perc(), trig);
		source = source * env;

	// 3. leave below code, Please
	}).store;
	name;
}.value();
)


// Optional part
/* Stay commented below!
// Add example/application/description

(
f = {
    arg dt = 0.1, dry = 0.5, wet = 0.5, note = 60, fbdk = 0.5;
    var source, local, trig, freq, env, feedback;

	trig = Trig1.ar(Dust.ar(1), 0.2);
	source = LFNoise2.ar(LFSaw.kr(1).range(100, 8000));
	freq = Rand(220, 880);

	source = source + SinOsc.ar(freq);
	env = EnvGen.kr(Env.perc(), trig);
	source = source * env;

	feedback = LocalIn.ar(2);
	local = feedback + [source, 0];
    local = DelayN.ar(local, 0.5, dt);
    LocalOut.ar(local.reverse * fbdk);
    (dry * source) + (wet * local);

}.play;
)

(
d = 0.01;
w = 1.0 - d;
f.set(\dry, d, \wet, w, \dt, 0.25, \fbdk, 0.8)
)

*/
