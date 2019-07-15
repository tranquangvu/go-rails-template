class Home {
  controller() {
    console.log('Log from every action in home controller');
  }

  index() {
    console.log('Log from home#index');
  }
}

Punchbox.on('Home', Home);
