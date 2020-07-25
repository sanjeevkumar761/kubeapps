import * as React from "react";
/*import logo from "../../logo.svg";*/
import logo from "../../souvfooterlogo.png";

// Icons
import Heart from "../../icons/Heart";

interface IFooterProps {
  appVersion: string;
}

const Footer: React.SFC<IFooterProps> = props => {
  return (
    <footer className="osFooter bg-dark type-color-reverse-anchor-reset">
      <div className="container padding-h-big padding-v-bigger">    
      </div>
    </footer>
  ); 
};

export default Footer;
