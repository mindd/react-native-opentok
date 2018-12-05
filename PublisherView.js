import { requireNativeComponent, View } from 'react-native';
import React from 'react';
import SessionViewProps from './SessionViewProps';

const noop = () => {};

class PublisherView extends React.Component {
  static propTypes = {
    ...View.propTypes,
    ...SessionViewProps,
  };

  static defaultProps = {
  };

  render() {
    return <RCTPublisherView {...this.props} />;
  }
}

const RCTPublisherView = requireNativeComponent('RCTOpenTokPublisherView', PublisherView);

export default PublisherView;
