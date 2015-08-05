var MessageBadge = React.createClass({  
  loadUnread: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({count: data.count});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadUnread();
    pollInterval = setInterval(this.loadUnread, this.props.pollInterval);
  },
  componentWillUnmount: function() {
    window.clearInterval(pollInterval);
  },
  render: function() {
    
    if (this.state.count === 0) {
      return (
          <div className="messageBadge">
            Messages
          </div>
        );
      
    } else {
      return (
          <div className="messageBadge">
            Messages <span className="badge">{this.state.count}</span>
          </div>
        );
      }
    }
    
});