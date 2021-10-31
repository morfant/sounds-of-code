// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : DynKlank
// Creator : Youngjoo Ryu
/*==========================================*/

(
{
	 // 1. Set synthdef name
	var name = \conga;


	// 2. Make your synthdef!
	SynthDef(name, {
		arg out, freqs = #[50, 300, 450], ringtimes = #[1, 1, 1];
		var signal;
		freqs = Array.rand(3, 50, 250).postln;
		ringtimes = Array.rand(3, 0.02, 0.4).postln;
		signal = DynKlank.ar(`[freqs, nil, ringtimes], Dust.ar([3, 5], [0.2, 0.2]));
		Out.ar(out, signal);

	// 3. leave below code, Please
	}).store;
	name;
}.value();
)


// Optional part
/* Stay commented below!
// Add example/application/description
*/
