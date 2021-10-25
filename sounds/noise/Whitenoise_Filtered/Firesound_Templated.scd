// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : Fire_burning_sound mimic
// Creator : Sangbin Rhie
/*==========================================*/

(
{
	// 1. Set synthdef name
	var name = \firegen

	(
		SynthDef.new(\firegen,
			{
				var triggersig, durscale, resfreq, noise, hiss, crackles, lapping, sig;
				noise = WhiteNoise.ar;
				hiss = HPF.ar(noise, 1000) * LFNoise2.kr(1).squared.squared;
				triggersig = Dust.kr(1);
				durscale = TRand.kr(1, 1.5, triggersig);
				resfreq = TExpRand.kr(100, 1000, triggersig);
				crackles = noise * EnvGen.ar(Env.perc(0, 0.02, curve: 0), triggersig, timeScale: durscale);
				crackles = crackles + BPF.ar(crackles, resfreq, 20);
				lapping = LeakDC.ar(LeakDC.ar(BPF.ar(noise, 30, 0.2) * 50).clip(-0.9, 0.9)) * 0.5;
				sig=([crackles, hiss, lapping] * [0.1, 0.3, 0.6]).sum * 3;
				Out.ar([0, 1], sig);
		}).store;
	)
	name;
}.value();
)


