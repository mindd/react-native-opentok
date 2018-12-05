import { requireNativeComponent, View } from 'react-native';
import React from 'react';
import SessionViewProps from './SessionViewProps';

const noop = () => {};

class SubscriberView extends React.Component {
  static propTypes = {
    ...View.propTypes,
    ...SessionViewProps,
  };

  static defaultProps = {
  };

  render() {
    return <RCTSubscriberView {...this.props} />;
  }
}
const RCTSubscriberView = requireNativeComponent('RCTOpenTokSubscriberView', SubscriberView);

export default SubscriberView;
