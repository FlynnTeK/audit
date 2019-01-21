import React from "react";
import Auction from "./auction";
import Captcha from "./captcha";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

const AuctionPage = () => <Auction />;
const CaptchaPage = () => <Captcha />;

const NavBar = () => (
  <Router>
    <div>
      <nav>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/auction/">Site For Sale</Link>
          </li>
          <li>
            <Link to="/captcha/">Check you are a human</Link>
          </li>
        </ul>
      </nav>

      <Route path="/auction/" component={AuctionPage} />
      <Route path="/captcha/" component={CaptchaPage} />
    </div>
  </Router>
);

export default NavBar;
