
var Comment = React.createClass({
  render: function() {
    
    
    if (this.props.role == "organizer"){
    return (
      <div className="comment">
        <h4 style={{color: "#428BCA"}}>
        {this.props.user}
        <small><b> {this.props.compName}</b></small>
        </h4>
        <p>{this.props.comment}</p>
      </div>
    );
  }
  if (this.props.role == "vendor"){
    return (
      <div className="comment text-right">
        <h4 style={{color: "rgb(243, 57, 57)"}}>
        <small><b>{this.props.compName}</b> </small>
        {this.props.user}
        </h4>
        <p>{this.props.comment}</p>
      </div>
    );
  }
  }
});