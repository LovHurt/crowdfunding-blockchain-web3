import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter as Router } from "react-router-dom";
import { ChainId, ThirdwebProvider } from "@thirdweb-dev/react";
import App from "./App";
import "./index.css";
import { StateContextProvider } from "./context";

ReactDOM.createRoot(document.getElementById("root")).render(
  <ThirdwebProvider chainId={ChainId.Sepolia}>
    <Router>
      <StateContextProvider>
        <App />
      </StateContextProvider>
    </Router>
  </ThirdwebProvider>
);
