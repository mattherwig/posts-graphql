import React from 'react';
import { isRouteErrorResponse, useRouteError } from 'react-router-dom';

export const AppErrorBoundary = () => {
  const error: any = useRouteError();
  console.error(error);

  const errorMessage = (() => {
    if (isRouteErrorResponse(error)) {
      if (error.status === 404) return 'This page doesnt exist!';
      if (error.status === 401) return 'You arent authorized to see this';
      if (error.status === 503) return 'Looks like our API is down';
      if (error.status === 418) return '🫖';
    } else {
      return 'Sorry, an unexpected error has occurred.';
    }
  })();

  return (
    <div id="error-page">
      <h1>Oops!</h1>
      <p>{errorMessage}</p>
      <p>
        <i>{error.statusText || error.message}</i>
      </p>
    </div>
  );
};

export default AppErrorBoundary;
