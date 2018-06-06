import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to WalletLess</h1>
        </header>
        <p className="App-intro">
          Walletless is a consumer-friendly app that enables users and healthcare providers
          to access stored information in a secure, convenient, accurate and timely manner.
          Users have immediate and easy access to a cyber wallet containing documents,
          insurance cards, and information that would normally be placed in wallets.
          Ultimately, additional information can be stored limited only by the imagination
          of the consumer. Healthcare providers with consent from their patients can
          access authorized, accurate information and documents from the patient and,
          thereby, reduce one of its biggest problems of incomplete and inaccurate
          information. Walletless will also facilitate streamlined communication between
          healthcare providers, patients and insurance companies. The app will provide an
          unparalled retention and marketing tool for healthcare providers. Walletless is
          the opportunity to get an edge in the new consumer driven healthcare market.
        </p>
      </div>
    );
  }
}

export default App;
