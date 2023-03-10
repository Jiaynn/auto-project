import React, { useState } from "react";

import reactLogo from "./assets/react.svg";

interface IProps {
  value: string;
}
const App: React.FC<IProps> = (props) => {
  const { value } = props;
  const [count, setCount] = useState(0);
  return (
    <div className="App">
      <div>
        <a href="https://vitejs.dev" target="_blank" rel="noreferrer">
          <img src="/vite.svg" className="logo" alt="Vite logo" />
        </a>
        <a href="https://reactjs.org" target="_blank" rel="noreferrer">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button
          onClick={() => {
            setCount((count) => count + 1);
          }}
        >
          count is {count}
        </button>
      </div>
      <p className="read-the-docs">on Vite and React logos to more</p>
      <p>{value}</p>
    </div>
  );
};

export default App;
