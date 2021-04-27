/**
 * 
 */
/*window.addEventListener('load', function () {
  console.log('Cette fonction est exécutée une fois quand la page est chargée.');
});*/

let lastValueFilter1;
let lastValueFilter2;
let lastValueFilter3;


/* Display the input of the selected selection. */ 

function refreshFilter1(){
	let filter1 = document.querySelector("#filter1_param");
	let value = filter1.options[filter1.selectedIndex].value;

	if(lastValueFilter1 != undefined && value != lastValueFilter1){
		const champsA = document.querySelector("#A" + lastValueFilter1);
		champsA.style.display = "none";
	}

	const champsA = document.querySelector("#A" + value);
	champsA.style.display = "block";
	lastValueFilter1 = value;
}

function refreshFilter2(){
	let filter2 = document.querySelector("#filter2_param");
	let value = filter2.options[filter2.selectedIndex].value;

	if(lastValueFilter2 != undefined && value != lastValueFilter2){
		const champsB = document.querySelector("#B" + lastValueFilter2);
		champsB.style.display = "none";
	}

	const champsB = document.querySelector("#B" + value);
	champsB.style.display = "block";
	lastValueFilter2 = value;
}

function refreshFilter3(){
	let filter3 = document.querySelector("#filter3_param");
	let value = filter3.options[filter3.selectedIndex].value;

	if(lastValueFilter3 != undefined && value != lastValueFilter3){
		const champsC = document.querySelector("#C" + lastValueFilter3);
		champsC.style.display = "none";
	}

	const champsC = document.querySelector("#C" + value);
	champsC.style.display = "block";
	lastValueFilter3 = value;
}

let table = document.querySelector("#table");
table.srcollTop = table.scrollHeight;

/*document.querySelector('#AV1').valueAsDate = new Date();
document.querySelector('#AV1Bis').valueAsDate = new Date();
document.querySelector('#BV1').valueAsDate = new Date();
document.querySelector('#BV1Bis').valueAsDate = new Date();
document.querySelector('#CV1').valueAsDate = new Date();
document.querySelector('#CV1Bis').valueAsDate = new Date();	
*/

const fcOnDbClickTabLine = () =>{
	const tr = document.querySelectorAll("#tr"); 
	let id;
	for(let i = 0; i < tr.length; i++){
		tr[i].addEventListener('dblclick', e => {
			id = tr[i].firstElementChild.innerHTML
			document.location.href="http://localhost:8180/ajouter-un-appel/"+id; 
		});
	}
}

fcOnDbClickTabLine();
/*const fctOnDbClick = (tbodyTr) => {
	for(let i = 0; i < tbodyTr.length; i++){
		console.log(tbodyTr[i]);
		tbodyTr[i].addEventListener('dblclick', e => {
			console.log("Salut");
		});
	}
};*/


