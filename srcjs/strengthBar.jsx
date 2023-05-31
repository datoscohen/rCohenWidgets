import { reactShinyInput } from 'reactR';
import PasswordStrengthBar from 'react-password-strength-bar';

const PasswordInputBar = ({ configuration, value, setValue }) => {
 return (
  <div>
    <div class="form-group shiny-input-container" style={{ width: '100%' }}>
      <label class="control-label" id="password_new-label" for="password_new">
      <i class="fas fa-lock" role="presentation" aria-label="lock icon"></i>
        &nbsp;Nueva Contraseña
      </label>
      <input type="password" class="form-control" value={value.password} onChange={e => setValue({...value, password: e.target.value})}/>
    </div>
    <PasswordStrengthBar
      password={value.password}
      scoreWords={configuration.scoreWords}
      minLength={configuration.minLength}
      shortScoreWord={configuration.shortScoreWord}
      onChangeScore={(score, feedback) => setValue({...value, score: score})}
      />
  </div>
  );
};

reactShinyInput('.strengthBar', 'rCohenWidgets.strengthBar', PasswordInputBar);
