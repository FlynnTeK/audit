import React, { Component } from "react";
import Navbar from "./components/navbar";
import "./App.css";

class App extends Component {

  render() {
    return (
      <div className="App">
        <Navbar />
        <h1>Good to Go!</h1>

      </div>
    );
  }
}

export default App;
