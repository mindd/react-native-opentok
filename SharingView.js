import { requireNativeComponent, View } from 'react-native';
import React from 'react';
import SessionViewProps from './SessionViewProps';

const noop = () => {};

class SharingView extends React.Component {
  static propTypes = {
    ...View.propTypes,
    ...SessionViewProps,
  };

  static defaultProps = {
  };

  render() {
    return <RCTSharingView {...this.props} />;
  }
}

const RCTSharingView = requireNativeComponent('RCTOpenTokSharingView', SharingView);

export default SharingView;
