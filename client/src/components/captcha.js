import React from "react";

class Captcha extends React.Component {
  render() {
    return (
      <div>
        <canvas></canvas>
        <input type="text" /><br/>
        <input type="button" />
      </div>
    );
  }
}

export default Captcha
