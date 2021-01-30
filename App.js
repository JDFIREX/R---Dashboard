let gs = gsap.timeline({defaults: {ease: "Power2.inOut"}});


let statsBTN = document.querySelector("#simple_button");
let stats = document.querySelector(".stats")
let statsOpen = false;

let wykresBTN = document.querySelector("#simple_wykres_btn");
let wykres = document.querySelector(".wykres_btn");
let wykresOpen = false;

window.addEventListener("load", (e) => {
    statsBTN.classList = "";
    wykresBTN.classList = "";
})



stats.addEventListener("click", (e) => {
    
    statsOpen ? closeStats() : openStats() ;
})

function openStats(){

    if(wykresOpen){
        closeWykres()
    }

    statsOpen = true;
    gs.to(stats,.3,{
        opacity: 0,
    })
    setTimeout(() => {
        stats.classList.add("statsBottom")
        statsBTN.innerHTML = "ZAMKNIJ"
    }, 600);
    gs.to(".stats_box",.3,{
        bottom: "0px"
    })
    gs.to(stats,.3,{
        opacity: "1"
    })
}

function closeStats() {
    statsOpen = false;
    gs.to(stats,.3,{
        opacity: 0,
    })
    setTimeout(() => {
        stats.classList.remove("statsBottom")
        statsBTN.innerHTML = "Statystyki"
    }, 300);
    gs.to(".stats_box",.5,{
        bottom: "-100vh"
    })
    gs.to(stats,.3,{
        opacity: "1"
    })
}

wykres.addEventListener("click", (e) => {
    wykresOpen ? closeWykres() : openWykres(); 
})

function openWykres(){
    if(statsOpen){
        closeStats()
    }
    wykresOpen = true;
    gs.to(".wykres_box",.3,{
        right: "0"
    })
    wykresBTN.innerHTML = "ZAMKNIJ"
}

function closeWykres(){
    wykresOpen = false;
    gs.to(".wykres_box",.5,{
        right: "-100vw"
    })
    wykresBTN.innerHTML = "WYKRES"
}