
import React, {useState} from "react";

export default function FavoriteColor() {
    const [color, setColor] = useState("red");
    const [text, setText] = useState("My favorite color is red");
    return (
        <div>
            <h1>Favorite Color</h1>
            <button type={"button"} onClick={() => setColor("red")} style={{color: "red"}}>Red</button>
            <button type={"button"} onClick={() => setColor("green")} style={{color: "green"}}>Green</button>
            <button type={"button"} onClick={() => setColor("blue")} style={{color: "blue"}}>Blue</button>
            <p>My favorite color is {color}</p>
            <input type={"text"} value={text} onChange={(e) => setText(e.target.value)}/>
        </div>
    );
}