Key.on('z', ['control', 'shift'], () => {
  console.log('did stuff');
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: screen.x + (screen.width / 2) - (window.frame().width / 2),
      y: screen.y + (screen.height / 2) - (window.frame().height / 2)
    });
  }
});


Key.on('x', ['control' ], () => {
   const screens = Screen.all();
   console.log('all screens=', screens);
  for (var s of screens) {
    const rect = s.frame();
    console.log('id=', s.identifier(), rect.x, rect.y, rect.width, rect.width);
  }
  const apps = App.all();
  for (var app of apps) {
    const windows = app.windows();
    if (windows.length >= 1) {
      console.log('app=', app.name());
      console.log('windows=', windows);
      for (var w of windows) {
        console.log(w.title());
      }
    }
  }

  console.log('----');
  const spaces = Space.all();
  for (var space of spaces) {
    console.log('space=', space);
    const windows = space.windows();
    if (windows.length >= 1) {
      console.log('space windows=', windows);
      for (var w of windows) {
        console.log(w.app().name(),'::::', w.title());
      }
    }

  }
  
});

const screenChangeHandler = Event.on('screensDidChange', () => {
   const screens = Screen.all();
   console.log('all screens=', screens);
  for (var s of screens) {
    console.log('id=', s.identifier());
  }
});
