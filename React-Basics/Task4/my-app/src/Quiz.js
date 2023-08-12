import React, { Component, Fragment } from 'react';
// import {Helmet} from 'react-helmet';

class Quiz extends Component{


    render(){
        return(
            <Fragment>
                
                <div className="questions">
                    <div className="lifeline-container">
                        <p>
                            <span className="mdi mdi-set-center mdi-24px lifeline-icon"></span>2
                        </p>
                        <p>
                            <span className="mdi mdi-lightbulb-on-outline mdi-24px lifeline-icon"></span>5
                        </p>
                        <p> 
                            <span> 1 of 15 </span>
                            2:15<span className="mdi mdi-timer-outline mdi-24px lifeline-icon"></span> 
                        </p>
                    </div>

                    <h5>Google was founded in which year?</h5>
                    <div className="options-container">
                        <p className="option">1998</p>
                        <p className="option">2005</p>
                    </div>
                    <div className="options-container">
                        <p className="option">1998</p>
                        <p className="option">2005</p>
                    </div>
                    <div className="button-container">
                        <button className="btn">Previous</button>
                        <button className="btn">Next</button>
                        <button className="btn">Quit</button>
                    </div>
                </div>
            </Fragment>
        )
    }
}

export default Quiz;