class Home {
  controller() {
    console.log('Hello from every action in home controller');
  }

  index() {
    console.log('Hello from home#index');
  }
}

Punchbox.on('Home', Home);
