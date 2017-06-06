class GameOfLife extends Polymer.Element {
  static get is() { return 'game-of-life'; }
  static get properties() {
    return {
      prop1: {
        type: String,
        value: 'game-of-life'
      }
    };
  }
}

window.customElements.define(GameOfLife.is, GameOfLife);

// const w = new Worker("../common.js");

// w.postMessage("start")

// setTimeout(() => w.terminate(), 8000)
