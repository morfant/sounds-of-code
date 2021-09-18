// Template
/*==========================================*/
// license
// 파일 생성 일자, 생성자 등 기본적인 사항 자동으로 만들어 질 수 있나?
// 형식: synthdef 이름을 리턴할 수 있는, store() 메소드
// 1 synth per 1 file

/*==========================================*/

(
{
	var name = \bbyong;
	SynthDef(name,
		{| freq=1000 |
			var sig, env;
			env = EnvGen.kr(Env.perc(0, 0.2), doneAction: 2);
			sig = Saw.ar([50, 150], mul: 0.5);
			sig = RLPF.ar(sig, XLine.kr([freq*10, freq*20], freq, 0.2, doneAction: 0), 0.1, 0.8) + RHPF.ar(sig, XLine.kr([freq*5, freq*10], freq*15, 0.2), 0.1, 0.8);
			sig = sig * env;
			Out.ar(0, sig);
	}).store();
	name;
}.value();
)

// (
// Pbind(
// 	\instrument, \bbyong,
// 	\dur, Pn(Pseq([Pseq([0.5, 0.25, 0.25]*0.5, 16), Pn(0.25, 8), Pn(0.125, 16)])),
// 	\freq, Pseq([10, 1000, 100], inf)
// ).play;
// )