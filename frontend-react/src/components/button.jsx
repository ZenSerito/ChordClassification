import { useEffect, useState } from "react";

const Button = ()=>{
    const [value, setValue] = useState(false);
    useEffect(()=>{
        alert("hello");
    })
    return <button onClick={() => {setValue(!value);console.log(value);}}>hello</button>
}
export default Button;