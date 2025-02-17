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


function configVivaldi(app, screens, spaces) {
  const single_screen = (screens.length == 1);
  const double_screen = (screens.length == 2);
  const triple_screen = (screens.length == 3);
  if (single_screen) {
    if (screens[0].identifier() == '37D8832A-2D66-02CA-B9F7-8F30A301B230') {
      // mac screen
      const can_focus = app.focus();
      console.log('vivaldi focus=', can_focus);
      if (app.focus()) {
        let frame = screens[0].frame();
        let win = app.mainWindow();
        if (win) {
          // spaces[0].moveWindows([win]);
          win.setFrame(frame);
        } 
      }
    } else {
      // some other screen, not the mac screen
    }
  } else if (double_screen) {
    console.log('double screen');
  } else if (triple_screen) {
    console.log('todo triple screen');
  }
}

Key.on('x', ['control'], () => {
  // displayplacer
  const screens = Screen.all();
  console.log('all screens=', screens);
  const spaces = Space.all();

  for (var s of screens) {
    const rect = s.frame();
    console.log('id=', s.identifier(), rect.x, rect.y, rect.width, rect.width);
  }

  const CHROME = 'Google Chrome';
  const SLACK = 'Slack';
  const VIVALDI = 'Vivaldi';
  const ITERM = 'iTerm2';
  const SUBLIME = 'Sublime Text';
  const JOPLIN = 'Joplin';
  const user_apps = [
    CHROME,
    SLACK,
    VIVALDI,
    ITERM,
    SUBLIME,
    JOPLIN,
  ];
  const apps = App.all();
  // get the current focus, so it can be restored later
  const currFocus = App.focused();
  for (var app of apps) {
    if (!user_apps.includes(app.name())) {
      continue;
    }
    if (app.name() == VIVALDI) {
      configVivaldi(app, screens, spaces);
    }
  }

  
  // for (var app of apps) {
  //   const windows = app.windows();
  //     console.log('1.app name=', app.name());
  //     console.log('2.app windows=', windows);
  //     for (var w of windows) {
  //       console.log(w.title());
  //     }
  // }

  console.log('----');
  // for (var space of spaces) {
  //   console.log('1.space=', space);
  //   const windows = space.windows();
  //   if (windows.length >= 0) {
  //     console.log('2.space windows=', windows);
  //     for (var w of windows) {
  //       console.log(w.app().name(),'::::', w.title());
  //     }
  //   }
  // }

  // console.log('----');
  // const windows = Window.all();
  // for (var w of windows) {
  //   console.log('1.just window=', w);
  //   console.log('2.just windows=', windows);
  //   console.log(w.app().name(),'::::', w.title());
  // }
  
  console.log('^^^^^^^^');
  // restore the focus
  currFocus.focus();
});

const screenChangeHandler = Event.on('screensDidChange', () => {
   const screens = Screen.all();
   console.log('all screens=', screens);
  for (var s of screens) {
    console.log('id=', s.identifier());
  }
});
