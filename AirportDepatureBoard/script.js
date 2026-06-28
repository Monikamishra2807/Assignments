const originalFlights = [
{
    time:"15:05",
    flight:"NH 0175",
    dest:"TOKYO",
    gate:"D02",
    status:"ON TIME"
},
{
    time:"15:15",
    flight:"WN 0612",
    dest:"LAS VEGAS",
    gate:"B09",
    status:"BOARDING"
},
{
    time:"12:59",
    flight:"F9 1635",
    dest:"BOSTON",
    gate:"B05",
    status:"DELAYED"
},
{
    time:"13:11",
    flight:"AS 3188",
    dest:"NEW YORK",
    gate:"D12",
    status:"ON TIME"
},
{
    time:"13:37",
    flight:"BA 1760",
    dest:"SAN FRANCISCO",
    gate:"B20",
    status:"BOARDING"
}
];

let flights = originalFlights.map(f => ({...f}));

const board = document.getElementById("board");
const counter = document.getElementById("summary");

const statusCells = [];

function updateClock(){

    document.getElementById("clock").textContent =
    new Date().toLocaleTimeString("en-US",{hour12:false});

}

setInterval(updateClock,1000);
updateClock();

function createCell(text){

    const cell=document.createElement("div");
    cell.className="cell";
    cell.textContent=text;

    return cell;

}

function applyStatusClass(cell,status){

    cell.classList.remove(
        "on-time",
        "boarding",
        "delayed",
        "closed",
        "departed"
    );

    if(status==="ON TIME") cell.classList.add("on-time");
    else if(status==="BOARDING") cell.classList.add("boarding");
    else if(status==="DELAYED") cell.classList.add("delayed");
    else if(status==="GATE CLOSED") cell.classList.add("closed");
    else if(status==="DEPARTED") cell.classList.add("departed");

}

function createFlightRow(flight,index){

    const row=document.createElement("div");
    row.className="row";

    row.appendChild(createCell(flight.time));
    row.appendChild(createCell(flight.flight));
    row.appendChild(createCell(flight.dest));
    row.appendChild(createCell(flight.gate));

    const statusCell=createCell(flight.status);

    applyStatusClass(statusCell,flight.status);

    statusCells[index]=statusCell;

    row.appendChild(statusCell);

    board.appendChild(row);

}

function updateCounter(){

    const boarding=flights.filter(f=>f.status==="BOARDING").length;
    const delayed=flights.filter(f=>f.status==="DELAYED").length;

    counter.textContent=
    `${flights.length} departures • ${boarding} boarding • ${delayed} delayed`;

}

function renderBoard(){

    board.replaceChildren();

    flights.forEach((flight,index)=>{

        createFlightRow(flight,index);

    });

    updateCounter();

}

const extraFlights=[

{
time:"16:45",
flight:"UA 9901",
dest:"DALLAS",
gate:"A15",
status:"ON TIME"
},
{
time:"17:10",
flight:"EK 204",
dest:"DUBAI",
gate:"C18",
status:"ON TIME"
},
{
time:"17:25",
flight:"SQ 801",
dest:"SINGAPORE",
gate:"D06",
status:"BOARDING"
},
{
time:"18:05",
flight:"LH 441",
dest:"FRANKFURT",
gate:"B12",
status:"ON TIME"
}

];

document.getElementById("addBtn").addEventListener("click",()=>{

    if(extraFlights.length===0) return;

    const random=Math.floor(Math.random()*extraFlights.length);

    const flight=extraFlights.splice(random,1)[0];

    flights.push({...flight});

    createFlightRow(flight,flights.length-1);

    updateCounter();

});

document.getElementById("resetBtn").addEventListener("click",()=>{

    flights=originalFlights.map(f=>({...f}));

    extraFlights.length=0;

    extraFlights.push(
        {
        time:"16:45",
        flight:"UA 9901",
        dest:"DALLAS",
        gate:"A15",
        status:"ON TIME"
        },
        {
        time:"17:10",
        flight:"EK 204",
        dest:"DUBAI",
        gate:"C18",
        status:"ON TIME"
        },
        {
        time:"17:25",
        flight:"SQ 801",
        dest:"SINGAPORE",
        gate:"D06",
        status:"BOARDING"
        },
        {
        time:"18:05",
        flight:"LH 441",
        dest:"FRANKFURT",
        gate:"B12",
        status:"ON TIME"
        }
    );

    renderBoard();

});

const statusFlow=[
"ON TIME",
"BOARDING",
"GATE CLOSED",
"DEPARTED"
];

function updateRandomFlightStatus(){

    if(flights.length===0) return;

    const index=Math.floor(Math.random()*flights.length);

    const current=flights[index].status;

    const position=statusFlow.indexOf(current);

    if(position!==-1){

        flights[index].status=
        statusFlow[(position+1)%statusFlow.length];

    }

    statusCells[index].textContent=flights[index].status;

    applyStatusClass(
        statusCells[index],
        flights[index].status
    );

    updateCounter();

}

setInterval(updateRandomFlightStatus,5000);

renderBoard();