import React from 'react';
import { Link, useMatches } from 'react-router-dom';
import classes from './Breadcrumbs.module.scss';

// Not needed currently but could be used later...
const Breadcrumbs = () => {
  const matches = useMatches();

  return (
    <div className={classes.container}>
      {matches.map(({ pathname, handle }, index) => {
        if (index === matches.length - 1) {
          return null;
        }

        // @ts-ignore
        const crumb = handle?.crumb;

        if (crumb) {
          return (
            <Link key={index} to={pathname}>
              {crumb}
            </Link>
          );
        }

        return <p key={index}>{pathname}</p>;
      })}
    </div>
  );
};

export default Breadcrumbs;
