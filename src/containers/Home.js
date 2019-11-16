import React from 'react'
import {connect} from 'react-redux'
import {bindActionCreators} from 'redux'
import * as constants from '../constants'

class Home extends React.Component {

  navigateToFirstIncompleteLevel() {

    // Find first incomplete level
    let target = this.props.levels[0].deployedAddress
    for(let i = 0; i < this.props.levels.length; i++) {
      const level = this.props.levels[i]
      const completed = this.props.completedLevels[level.deployedAddress]
      if(!completed) {
        target = level.deployedAddress
        break
      }
    }

    // Navigate to first incomplete level
    this.props.router.push(`${constants.PATH_LEVEL_ROOT}${target}`)
  }

  render() {
    return (
      <div
        className="row"
        style={{
        paddingLeft: '40px',
        paddingRight: '40px',
      }}>

        <div className="col-sm-12">

          {/* TITLE */}
          <h2 className="title">
            Cypherpunks CTF&nbsp;
          </h2>
          <p>
            Cypherpunks CTF 挑戰之目的，
      在於讓參與者們更了解智能合約的相關安全議題，
      基於良性競爭的前提下，歡迎挑戰者們發揮想像力來破解遊戲，

      然而，為賦予每一位挑戰者公平挑戰的權利，
      請遵守以下解題及挑戰原則:<br></br>
      &nbsp; 1. 請勿攻擊平台 <br></br>
      &nbsp; 2. 請勿攻擊而導致其他挑戰者無法參與 <br></br>

      謝謝大家配合，
      希望大家都能享受挑戰過程!
          </p>
          {/* INFO */}
          <button
            style={{marginTop: '10px'}}
            className="btn btn-primary"
            onClick={() => this.navigateToFirstIncompleteLevel()}
          >
            Play now! 
          </button>
          <hr></hr>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  return {
    levels: state.gamedata.levels,
    completedLevels: state.player.completedLevels
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({

  }, dispatch);
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Home);
