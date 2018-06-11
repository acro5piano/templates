// @flow

import React from 'react'
import { compose } from 'recompose'
import { withStyles, WithStyles } from '@material-ui/core/styles'

type Props = {
  title: string;
}

const SfcMaterialUi = ({ title }: Props & WithStyles) => {
  const onClick = () => console.log('hello')

  return (
    <div className={classes.title}>
      {title}
    </div>
  )
}

const styles = theme => ({
  title: {
    color: theme.palette.primary.dark,
  },
})

export const Header = compose(
  withStyles(styles),
)(_Header)
