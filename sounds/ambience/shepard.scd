// Template
/*==========================================*/
// GNU
// 2022.Feb.1st, Sangbin Rhie
// 형식: synthdef 이름을 리턴할 수 있는, store() 메소드
// 1 synth per 1 file

//
//  shepard.scd                               // filename
//  ambience                                          // category
//  ascending 4-voice shepard tone                                    // description
//  Created by SangBin Rhie on 2022/02/01.          // 파일 생성자, 일자
//  Creator SangBin Rhie.

/*==========================================*/

(
{
	var name=\Shepard_C#
	SynthDef.new(name, {
		var sig1,amp1,freq1,sig2,amp2,freq2,freq3,amp3,sig3,sig4,freq4,amp4,env,buff,levels=[0, 1, 0.5, 0.5, 0],pr=1.05946;

		env=Env.new(
			levels: levels++((-1*levels).reverse),
			times: [0.5, 0.5, 1.0, 0.5, 0.5].mirror).asSignal(257);
		buff=Buffer.alloc(s, 512, 1);
		buff.loadCollection(env.asWavetableNoWrap);

		freq1=EnvGen.kr(Env.new([61, 73, 85, 97, 109, 61], [4.9975,4.9975,4.9975,4.9975,0.01], [pr,pr,pr,pr,1]), gate: Impulse.kr(1/20), doneAction: 0);
		amp1=EnvGen.kr(Env.new([0, 1, 0], [10, 9.99], [1, -1]), doneAction: 0, gate: Impulse.kr(1/20));
		sig1=Osc.ar(buff, freq1.midicps/4, mul: amp1);

		freq2=EnvGen.kr(Env.new([61, 73, 85, 97, 109, 61], [4.9975,4.9975,4.9975,4.9975,0.01], [pr,pr,pr,pr,1]), gate: Impulse.kr(1/20, 0.2475), doneAction: 0);
		amp2=EnvGen.kr(Env.new([0, 1, 0], [10, 9.99], [1, -1]), doneAction: 0, gate: Impulse.kr(1/20, 0.2475));
		sig2=Osc.ar(buff, freq2.midicps/4, mul: amp2);

		freq3=EnvGen.kr(Env.new([61, 73, 85, 97, 109, 61], [4.9975,4.9975,4.9975,4.9975,0.01], [pr,pr,pr,pr,1]), gate: Impulse.kr(1/20, 0.495), doneAction: 0);
		amp3=EnvGen.kr(Env.new([0, 1, 0], [10, 9.99], [1, -1]), doneAction: 0, gate: Impulse.kr(1/20, 0.495));
		sig3=Osc.ar(buff, freq3.midicps/4, mul: amp3);

		freq4=EnvGen.kr(Env.new([61, 73, 85, 97, 109, 61], [4.9975,4.9975,4.9975,4.9975,0.01], [pr,pr,pr,pr,1]), gate: Impulse.kr(1/20, 0.7425), doneAction: 0);
		amp4=EnvGen.kr(Env.new([0, 1, 0], [10, 9.99], [1, -1]), doneAction: 0, gate: Impulse.kr(1/20, 0.7425));
		sig4=Osc.ar(buff, freq4.midicps/4, mul: amp4);

		Out.ar(0,Pan2.ar((sig1+sig2+sig3+sig4)/4, 0));
	}).store();
	name;
}.value();
)

//~synth_5=Synth("Shepard_C#");