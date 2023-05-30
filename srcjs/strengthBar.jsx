import { reactShinyInput } from 'reactR';
import PasswordStrengthBar from 'react-password-strength-bar';

const PasswordInputBar = ({ configuration, value, setValue }) => {
  const [password, setPassword] = React.useState("");
  const [newScore, setScore] = React.useState(0);

  const handlePasswordChange = (e) => {
    setPassword(e.target.value);
    setValue([e.target.value, newScore]);
  };

  const handleScoreChange = (score, feedback) => {
    setScore(score); // update the score state
    if (score) {
      setValue([password, score])
    }
  };

  return (
    <div>
      <div class="form-group shiny-input-container"  style={{ width: '100%' }}>
        <label class="control-label">
          <i class="fas fa-lock" role="presentation" aria-label="lock icon"></i>
          &nbsp;Nueva Contraseña
        </label>
        <input
          type="password"
          class="form-control"
          value={password}
          onChange={handlePasswordChange}
        />
      </div>
      <PasswordStrengthBar
        password={password}
        scoreWords={configuration.scoreWords}
        minLength={configuration.minLength}
        shortScoreWord={configuration.shortScoreWord}
        onChangeScore={handleScoreChange}
      />
    </div>
  );
};

reactShinyInput('.strengthBar', 'rCohenWidgets.strengthBar', PasswordInputBar);
