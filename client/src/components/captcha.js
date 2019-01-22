import React from "react";

function getCaptchaImage()
{

}

function generateCaptchaImage()
{
  
}

class Captcha extends React.Component {
  render() {
    return (
      <div>
        <canvas style="display; none;"></canvas>
        <img id="captchaImage" /><br/>
        <input type="text" /><br/>
        <input type="button" />
      </div>
    );
  }
}

export default Captcha
