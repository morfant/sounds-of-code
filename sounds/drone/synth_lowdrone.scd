// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : SOS, filterbank, Pattern
// Creator : Youngjoo Ryu
/*==========================================*/

(
{
	 // 1. Set synthdef name
	var name = \lowdrone;


	// 2. Make your synthdef!
	SynthDef(name, {
		arg freq1 = 1000, freq2 = 444;
		var sig1, sig2, env, fil1, fil2, fil3, fil4;
		sig1 = Saw.ar(freq1 * LFNoise1.ar(5, mul: 0.25));
		sig2 = Saw.ar(freq2 * LFNoise2.ar(1.75, mul: 0.5));
		env = LFTri.ar(30, mul: 0.3, add: 0.3);
		sig1 = sig1 * env;
		sig2 = sig2 * env;

		fil1 = Ringz.ar(sig1, 20, mul: 0.005);
		fil2 = RHPF.ar(sig1, 150);
		fil3 = BPF.ar(sig2, 444, 0.2);
		fil4 = Ringz.ar(fil3, 40, mul: 0.5);

		Out.ar(0, [fil1 + fil2, fil4]);


	// 3. leave below code, Please
	}).store;
	name;
}.value();
)


// Optional part
/* Stay commented below!


*/
