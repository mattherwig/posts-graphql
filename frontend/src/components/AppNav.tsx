import React from 'react';
import { Link } from 'react-router-dom';

import classes from './AppNav.module.scss';

const AppNav = () => {
  return (
    <nav className={classes.container}>
      <div className={classes.left}>
        <Link to="/">Home</Link>
        <Link to="/about">About</Link>
      </div>
      <div className={classes.right}>
        <Link to="/users/profile">Profile</Link>
      </div>
    </nav>
  );
};

export default AppNav;
