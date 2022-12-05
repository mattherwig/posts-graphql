import React from 'react';
import { Outlet } from 'react-router-dom';

import classes from './AppLayout.module.scss';
import AppNav from './AppNav';

const AppLayout = () => {
  return (
    <div className={classes.container}>
      <AppNav />
      {/* <header></header> */}
      <main className={classes.body}>
        <Outlet />
      </main>
      {/* <footer></footer> */}
    </div>
  );
};

export default AppLayout;
